# Shoginet - Distributed Network for [lishogi.org](lishogi.org)

Based on [fairyfishnet](https://github.com/gbtami/fairyfishnet).

## How to setup

#### Linux

You need to have YaneuraOu for NNUE ready. To achieve this you can use the provided script `build-yaneuraou.sh`. The script first clones [YaneuraOu github](https://github.com/yaneurao/YaneuraOu) and then runs the make command either with avx2 or sse42 depending on your cpu.
You can also try using the provided precompiled 'YaneuraOu-by-gcc' for intel with avx2, if that works for you or build YaneuraOu with some script in YaneuraOu/script.
You can also try downloading YaneuraOu from https://github.com/mizar/YaneuraOu/releases.
To test that engine works on you machine just run the engine `./YaneuraOu-by-gcc`.

```
usi
isready
```

after readyOk appears run:
`bench`
If the engine didn't crash, it probably works.

The same is necessary for Fairy-Stockfish, binaries for linux are once again provided, but for other platforms consider compiling them yourself of downloading them from https://github.com/ianfab/Fairy-Stockfish/releases.

If you have YaneuraOu and Fairy-Stockfish ready and python3 installed just run `python3 ./shoginet.py`, it will ask you about what working directory you want to use, path to the engine and similar things, leaving everything default should be fine. Currently no key is required.
If you want to go over this setup step again, just delete shoginet.ini.

#### Windows

Windows is not supported right now. Although almost everything should be fine. You will obviously have to compile YaneuraOu for windows and provide the correct path, when shoginet.py asks you the first time.

## How it works

Every once in a while shoginet running on your computer asks lishogi.org for some work. If someone requested analysis of their game on lishogi.org, you may receive this work. The work is a simple json containing mainly the initial position and sequence of moves. You then run engine analysis on these data and send the results back to lishogi.org.
