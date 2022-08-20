FROM python:3.10

COPY . .

RUN pip install requests
RUN chmod +x fairy-stockfish-largeboard_x86-64-modern
RUN chmod +x YaneuraOu-by-gcc-SSE42