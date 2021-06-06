using Godot;
using System;

public class Town : VehicleBody
{


	[Export]
	float speed = 4;

	[Export]
	double rotationSpeed = 0.85;

	public override void _PhysicsProcess(float delta)
	{
		float needSpeed = 0;
		double needRotSpeed = 0;

		if (Input.IsActionPressed("forward_move"))
		{
			needSpeed = speed;
		}
		if (Input.IsActionPressed("back_move"))
		{
			needSpeed = -speed;
		}
		if (Input.IsActionPressed("right_move"))
		{
			needRotSpeed = rotationSpeed;
		}
		if (Input.IsActionPressed("left_move"))
		{
			needRotSpeed = -rotationSpeed;
		}
		speed = Mathf.Lerp(speed, needSpeed, 0.1f);
		EngineForce = speed;
		/*if (needSpeed > 0)
        {
			speed = Mathf.Lerp(speed, needSpeed, 0.1f);
			EngineForce = speed;
		}*/
	}
	
	void getInput(float delta)
	{
		if (Input.IsActionPressed("forward_move")) {

		}
		if (Input.IsActionPressed("back_move")) {

		}
		if (Input.IsActionPressed("right_move")) {

		}
		if (Input.IsActionPressed("left_move")) {

		}
	}

}

