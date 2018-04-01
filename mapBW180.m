function [ out ] = mapBW180( in )
    out=mod(in,360);
    if(out>180)
        out=out-360;
    elseif(out<-180)
        out=out+360;
    end
end

