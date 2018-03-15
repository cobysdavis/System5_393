function [ f ] = inputManual( t )
	% Write your own equation here.
	

    %---------- This is an example of something you could do to create a discontinuous function.
	a=0
    if (t == a)
		f = 1000000;
	else
		f = 10;
	end

	%-----------
end
