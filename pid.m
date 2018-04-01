s=tf('s')
sys = zpk([z1 z2 -z3],[-p1 -p2 -p3 -p4],[1])
pidTuner(sys)
