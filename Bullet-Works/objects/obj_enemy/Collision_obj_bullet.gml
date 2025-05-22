/// @DnDAction : YoYo Games.Instances.Color_Sprite
/// @DnDVersion : 1
/// @DnDHash : 28B8DDF0
/// @DnDArgument : "colour" "$00FFFFFF"
image_blend = $00FFFFFF & $ffffff;
image_alpha = ($00FFFFFF >> 24) / $ff;

/// @DnDAction : YoYo Games.Particles.Effect
/// @DnDVersion : 1
/// @DnDHash : 63FE9D26
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "type" "7"
effect_create_below(7, x + 0, y + 0, 0, $FFFFFF & $ffffff);