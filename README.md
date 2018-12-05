Preface
=======

About the book
------------------------------------

This book presents a series of activities to teach the basics of computer networks. While you will not
learn all aspects of computer networking, we hope that it will serve as a good starting point.
To network micro:bits, we use custom micro:bit radio to radio communication. When one hears the
word radio, what comes to mind is the radio that blasts out tunes from your favourite radio broadcasting
channel. But, a radio, or a radio transceiver (transmitter/receiver), is used in communications to
generate and receive radio waves that contain information such as audio, video or digital data. And
all micro:bits have built-in radios[^1].
Each chapter presents interesting challenges in radio communications and networking with micro:bits.
After every few chapters, there’s an exciting game to look forward to! In the programming sections,
you will use the JavaScript Blocks Editor at https://makecode.microbit.org/ to develop solutions to
overcome those challenges[^2].
Writing this book, we have assumed no knowledge of radio communications or networking.
However, we assume that you have written programs with a micro:bit. For example, we expect that
you are familiar with variables, if-then-else statements, and loops. The activities in each chapter will
provide ample opportunity to put this knowledge into practice.

Outline 
-------

-   [**Connecting micro:bits with wires**]()  
    This chapter is an introduction and a fun demonstration of networking. Micro:bits can communicate
    when connected with wires. Via wires, you will send images between micro:bits.

-   [**Broadcast communication: One to all**]()  
    You will start using radio communication in this chapter and learn about broadcast communication.
    With broadcast communication, one micro:bit can send messages to many other micro:bits. But, be
    cautious! If all micro:bits do that, it’s like everyone is speaking at once.

-   [**Group communication: One to many**]()   
    By forming small groups, you will send to and receive from a limited number of micro:bits. This is more
    manageable than broadcast. But, selecting a unique identifier for your group will be an interesting
     challenge.

-   [**Game 1: Shakey Donkey**]()   
    This is a game that uses the micro:bit radio. See whether you can figure out how to play the game,
    and how it works.

-   [**Unicast Communication: One to One**]()   
    Broadcast and group communication are fun. But sometimes you want to talk to only one person.
    This is called unicast communication. To do this, you discover that you will need a unique identifier
    for your micro:bit.

-   [**Two-way Unicast**]()   
    It’s no use talking with somebody if you don’t get a response back. In this chapter, you will program
    your micro:bit to send a message and to get a reply. Also, you will work out how long it takes for a
    reply to come back. Doing this, you will also program one of the most important tools used in the
    Internet: Ping.

-   [**Game 2: Rock-Paper-Scissors over Radio**]()     
    This is not like the traditional Rock-Paper-Scissors game. It
    works over the radio!

-   [**Handling errors: Retransmissions**]()   
     Nothing is perfect, not even radio communication. What happens if
    your message gets lost on the way? In this chapter, you will test
    methods for dealing with message loss. For instance, does it help if
    you send your messages more than once?

-   [**Handling errors: Acknowledgements**]()   
    It’s a waste to retransmit if the other side already received the message! The receiver needs a
    standard reply (or an acknowledgement) to avoid this. At the sending side, if you do not receive an
    acknowledgement, you can assume that your message wasn’t received. In this chapter, you will test
    how well acknowledgments work to improve reliability.

-   [**Game 3: Battleship over Radio**]()     
    You have come far. Now you are ready for another classic game!
    You will write a version of the famous Battleship game using
    your micro:bits. Your experience with radio communication and
    networking will help you along the way.

Let’s start!

(^1) The CPU on the micro:bit is a Nordic Semiconductor nRF51822 and contains a built-in 2.4GHz radio module. This radio can be configured to run Bluetooth Low Energy
(BLE) protocol but in this book, we will use the simpler micro:bit to micro:bit communication.

(^2) This version of the book uses JavaScript Blocks Editor; we are also working on a MicroPython version.
