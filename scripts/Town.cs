using Godot;
using System.Collections.Generic;

public class Town : RigidBody
{
	[Export]
	float enginePower = 280;

	public List<RaycastDriver> rayElements = new List<RaycastDriver>();
	float drivePerRay;

	void inputDrive(float delta)
    {
		foreach (RaycastDriver ray in rayElements)
        {
			int dir = 0;
			if (Input.IsActionPressed("forward_move"))
			{
				++dir;
			}
			if (Input.IsActionPressed("back_move"))
			{
				--dir;
			}
			if (Input.IsActionPressed("left_move"))
            {
				if (ray.Transform.origin.x > 0) --dir;
				else ++dir;
            }
			if (Input.IsActionPressed("right_move"))
			{
				if (ray.Transform.origin.x > 0) ++dir;
				else --dir;
			}
            ray.applyDriveForce(dir * GlobalTransform.basis.z * drivePerRay * delta);
		}
    }

    public override void _Ready()
    {		
		foreach (Node node in GetChildren())
        {
			if (node is RayCast)
            {
				rayElements.Add((RaycastDriver)node);
            }
        }
		drivePerRay = enginePower / rayElements.Count;
	}

    public override void _PhysicsProcess(float delta)
	{
		inputDrive(delta);
	}

}

