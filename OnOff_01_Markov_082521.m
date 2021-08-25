clear all;
close all;

% Represents a simple 2 step Markov Chain (states 0-off and 1-on).

State = 0;  %initial state of machine
Log(1) = State;   %log of history of states

P_01 = 0.7; %probability of state 0 going to state 1
P_00 = 1-P_01;  %probability of state 0 staying in state 0

P_10 = 0.5; %probability of state 1 going to state 0
P_11 = 1-P_10;  %probability of state 1 staying in state 1

Events = 1000;  %number of events that occur

for i = 1:Events
    Step = i;
    j = rand;   %random number to decide what occurs in step
    
    if State == 0
        if j <= P_01  %if j is less than probability of state swapping...
            State = 1;  %...then switch states of machine
        end
    else
        if j <= P_10  %if j is less than probability of state swapping...
            State = 0;  %...then switch states of machine
        end
    end
    Log(i+1) = State;
end

figure(1);
B = insertshape(