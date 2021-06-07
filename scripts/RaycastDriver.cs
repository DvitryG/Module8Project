using Godot;

public class RaycastDriver : RayCast
{
    [Export]
    float maxForce = 300;
    [Export]
    float springForce = 180;
    [Export]
    float stiffness = 0.85f;
    [Export]
    float damping = 0.05f;
    [Export]
    float Xtraction = 1;
    [Export]
    float Ztraction = 0.15f;

    public Vector3 instantLinearVelocity;

    private Town parentBody;
    private float previousDistance;
    private Vector3 previousHit = new Vector3(); 

    public void applyDriveForce(Vector3 force)
    {
        if (IsColliding())
        {
            parentBody.ApplyImpulse(parentBody.GlobalTransform.basis.Xform(parentBody.ToLocal(GetCollisionPoint())), force);
        }
    }

    public override void _Ready()
    {
        previousDistance = Mathf.Abs(CastTo.y);
        parentBody = GetParent<Town>();
        AddException(parentBody);
    }

    public override void _PhysicsProcess(float delta)
    {
        if (IsColliding())
        {
            Vector3 curHit = GetCollisionPoint();
            instantLinearVelocity = (curHit - previousHit) / delta;

            float curDistance = (GlobalTransform.origin - GetCollisionPoint()).Length();
            float FSpring = stiffness * (Mathf.Abs(CastTo.y) - curDistance);
            float FDamp = damping * (previousDistance - curDistance) / delta;
            float suspensionForce = Mathf.Clamp((FSpring + FDamp) * springForce, 0, maxForce);
            Vector3 suspensionImpulse = GlobalTransform.basis.y * suspensionForce * delta;

            float ZVelocity = GlobalTransform.basis.XformInv(instantLinearVelocity).z;
            float XVelocity = GlobalTransform.basis.XformInv(instantLinearVelocity).x;

            Vector3 XForce = -GlobalTransform.basis.x * XVelocity * (parentBody.Weight * parentBody.GravityScale) / parentBody.rayElements.Count * Xtraction * delta;
            Vector3 ZForce = -GlobalTransform.basis.z * ZVelocity * (parentBody.Weight * parentBody.GravityScale) / parentBody.rayElements.Count * Ztraction * delta;

            XForce.x -= suspensionImpulse.x * parentBody.GlobalTransform.basis.y.Dot(Vector3.Up);
            ZForce.z -= suspensionImpulse.z * parentBody.GlobalTransform.basis.y.Dot(Vector3.Up);

            Vector3 finalForce = suspensionImpulse + XForce + ZForce;

            parentBody.ApplyImpulse(parentBody.GlobalTransform.basis.Xform(parentBody.ToLocal(GetCollisionPoint())), finalForce);
            previousDistance = curDistance;
            previousHit = curHit;
        }
        else
        {
            previousDistance = -CastTo.y;
            previousHit = ToGlobal(CastTo);
        }
    }
}
