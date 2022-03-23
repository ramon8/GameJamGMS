

steering_forces.add(arrive_force(oShip.x, oShip.y, 10));
steering_forces.add(collision_avoidance(object_index, 10));

steering_forces.limit_magnitude(max_force);
velocity.add(steering_forces);
velocity.limit_magnitude(max_speed)
position.add(velocity);


steering_forces.set(0, 0);
	
image_angle = point_direction(0, 0, velocity.x, velocity.y)

x = position.x;
y = position.y;