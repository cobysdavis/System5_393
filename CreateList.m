function [ ] = CreateList(min,max)
sz=min+max+1
List=zeros(1,sz)

for k=1:sz
    A=load(strcat(char(k+64),'.mat'))
    input=A.(char(k+64)).input.time
end