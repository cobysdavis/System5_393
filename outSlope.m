function [ res ] = outSlope( A,period,outtime,outputFiltered )
    if (outputFiltered(outtime(A)+floor(period/7))-outputFiltered(outtime(A)-floor(period/7)))/(outtime(A)+floor(period/7)-(outtime(A)-floor(period/7)))>0
        res=1;
    else
        res=-1;      
    end

end

