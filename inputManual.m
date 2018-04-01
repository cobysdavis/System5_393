function [ f ] = inputManual( t )	

	e=1000000000
    if (t <1/e)
		f = e;
	else
		f = 0;
	end

end
