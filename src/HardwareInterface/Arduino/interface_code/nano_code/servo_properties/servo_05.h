#define NANO_ID 5
#define FEEDBACK_PWM_MIN 499
#define FEEDBACK_PWM_MAX 1496
#define FEEDBACK_PWM_MIDDLE ( (FEEDBACK_PWM_MAX + FEEDBACK_PWM_MIN) / 2 )
#define COMMAND_PWM_MIN 485
#define COMMAND_PWM_MAX 1482

#define CLOCKWISE_PWM_MIN 2086
#define CLOCKWISE_PWM_MAX 2173
#define CLOCKWISE_SPEED_MIN 67  //unit: 0.1degree/50ms
#define CLOCKWISE_SPEED_MAX 129
#define ANTICLOCKWISE_PWM_MIN 1877  //this pwm command will produce mininum anticlockwise speed
#define ANTICLOCKWISE_PWM_MAX 1790
#define ANTICLOCKWISE_SPEED_MIN -67
#define ANTICLOCKWISE_SPEED_MAX -131