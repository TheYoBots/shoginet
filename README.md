# Shoginet - Distributed Network for [lishogi.org](https://lishogi.org/)

Based on [fairyfishnet](https://github.com/gbtami/fairyfishnet).

## How to setup

#### Linux

You need to have YaneuraOu for NNUE ready. To achieve this you can use the provided script `build-yaneuraou.sh`. The script first clones [YaneuraOu github](https://github.com/yaneurao/YaneuraOu) and then runs the make command either with avx2 or sse42 depending on your cpu.
You can also try using the provided precompiled 'YaneuraOu-by-gcc' for intel with avx2, if that works for you or build YaneuraOu with some script in YaneuraOu/script.
To test that engine works on you machine just run the engine `./YaneuraOu-by-gcc`.

```
usi
isready
```
after readyOk appears run:
`bench`
If the engine didn't crash, it probably works.

If you have YaneuraOu ready and python3 installed just run `python3 ./shoginet.py`, it will ask you about what working directory you want to use, path to the engine and similar things, leaving everything default should be fine. Currently no key is required.
If you want to go over this setup step again, just delete the `fishnet.ini`.

#### Windows

Shoginet should works on windows the same way it does on linux, though you require make a few small changes.

Firstly, you need to get YaneuraOu v6.0.0 with NNUE for windows, which you will find in [YaneuraOu's releases](https://github.com/yaneurao/YaneuraOu/releases). To test that engine works on you machine just run the engine `./YaneuraOu-*` (The name of the engine you downloaded). 
```
usi
isready
```
after `readyOk` appears run: 
```
bench
```
If the engine didn't crash, it probably works. Make sure to add the windows version of YaneuraOu that you have downloaded in the shoginet directory.

If you have YaneuraOu ready and python3 installed just run `python3 ./shoginet.py`, it will ask you about what working directory you want to use, path to the engine and similar things, leaving everything default should be fine, just provide the proper path the YaneuraOu engine that you have downloaded. Currently no key is required.

If you want to go over this setup step again, just delete the `fishnet.ini` file.

#### Docker

If you have a Docker engine installed, installation via Docker is the easiest
and most reliable way to run Shoginet. You can simply do:

```bash
docker build -t shoginet:latest .
```

And once that completes, run it with:

```bash
docker run -it shoginet:latest
```

(If you already have a `fishnet.ini` file prepared, you can bindmount that file
in to `/shoginet/fishnet.ini`. Otherwise, you'll be prompted for configuration 
values.)

#### Heroku

To set up shoginet in Heroku you need to have a [Heroku account](https://signup.heroku.com/login) and might need to fork or import this repository. If you have a fork of [shoginet](https://github.com/WandererXII/shoginet) then you can simply create a new branch on your repository, add a remote to this repository and then pull the `heroku` branch as follows:

```
git checkout -b new-branch # 'new-branch' can be replaced with whatever you want to name your branch. The name doesn't really matter. This creates a new branch.
git remote add theyobots https://github.com/TheYoBots/shoginet.git # This adds a remote.
git fetch theyobots heroku && git reset --hard theyobots/heroku # This pulls all the code from this repository.
git push --force origin new-branch
```

Now that you have all you need, all you need to do is create a [new app in heroku](https://dashboard.heroku.com/new-app) (the name and region don't matter), then go to the `Deploy` tab and select `GitHub` under `Deployment method` and then scroll down and click on `search` and `connect` your fork/import of shoginet. Now you need to `Deploy` to the 'new-branch'/'heroku' and wait for the deployment to complete. Once it has been completed, go to the `Resources` tab and enable `worker` dynos and shoginet should start running soon!

## How it works

Every once in a while shoginet running on your computer asks [lishogi.org](https://lishogi.org/) for some work. If someone requested analysis of their game on [lishogi.org](https://lishogi.org/), you may receive this work. The work is a simple json containing mainly the initial position and sequence of moves. You then run engine analysis on these data and send the results back to [lishogi.org](https://lishogi.org/).