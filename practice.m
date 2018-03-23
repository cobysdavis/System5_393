A=[1 -2 3]
B=[]
for i=1:3
    if A(i)>0
        B(i)=A(i)
    else
        B(i)=nan
    end
    
end
figure
plot(B,'*r')