function [out] =letter(in)
    step=26
    loops=ceil((in)/26)
    out=zeros(1,loops)
    for i=1:loops
        num=in-26
        out(i)=num
    end
    for i=1:loops
        out(i)=out(i)+64
    end
    out=char(out)
end