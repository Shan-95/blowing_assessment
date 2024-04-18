# README



* ...
Write an API for a bowling game.

You have the freedom to define the architecture of the API and what its endpoints will look
like.
Main Requirements

The API should be written using Ruby; the framework definition is your call. In addition, it
should provide the following actions:
− Start a new bowling game.
− Input the number of pins knocked down by each ball.
− Output the current game score (which consists of the score for each frame and total
score).
Imagine that a bowling house will use this API. On the screen, the user starts the game. Then,
after each throw, the machine counts how many pins were dropped and calls the API to send
this information. In the meantime, the screen is constant.
(For example: every 2 seconds) querying the API for the game score and displaying it. Be
tolerant of application restarts.
Logic details
− Bowling is played by throwing a ball down a narrow alley towards ten wooden pins. The
objective is to knock down as many pins as possible per throw.
− The game is played in ten frames. At the beginning of each frame, all ten pins are set up.
The player then gets two tries to knock them all down.
− If the player knocks all the pins down on the first try, it is called a “strike” and the frame
ends.
− If the player fails to knock down all the pins with his first ball but succeeds with the
second ball, it is called a “spare”.
− After the second ball of the frame, the frame ends even if pins are still standing.
− A strike frame is scored by adding ten plus the number of pins knocked down by the
next two balls to the score of the previous frame.
− A spare frame is scored by adding ten plus the number of pins knocked down by the
next ball, to the score of the previous frame.
− Otherwise, a frame is scored by adding the number of pins knocked down by the two
balls in the frame to the score of the previous frame.
− If a strike is thrown in the tenth frame, the player may throw two more balls to
complete the strike's score.

− Likewise, if a spare is thrown in the tenth frame, the player may throw one more ball to
complete the score of the spare.
− Therefore, the tenth frame may have three balls instead of two. For more information,
please see
https://en.wikipedia.org/wiki/Ten-pin_bowling

Documentation:
Provide a README file explaining how to set up and run your application and tests. Include
comments in your code for clarity. Version Control: Use Git for version control. Push your code
to a public repository on GitHub or GitLab.
Submission Guidelines:
• Repository Link: Share the link to your public repository.
• Deadline: Submit your project (2 days after receiving).
