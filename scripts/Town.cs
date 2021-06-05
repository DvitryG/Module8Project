using Godot;
using System;

public class Town : KinematicBody
{
	Vector3 gravity = Vector3.Down * 10;
	int speed = 4;
	double rotationSpeed = 0.85;

	Vector3 velocity = Vector3.Zero;
	
	void _physicsProcess(int delta)
    {

    } 
	
	/*public override void _Ready()
	{
		
	}*/

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
