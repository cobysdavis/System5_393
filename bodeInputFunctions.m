function [ ] = bodeInputFunctions(min,max,step)

    % Launch the GUI, which is a singleton
    open stateSpace.mdl
    blackBox;
    syms t
    l=(max+min+1)
    p=(step-1)*(max+min)
    sz=l+p;
    funs=zeros(1,sz,'sym');
    freq=zeros(1,sz);
    for i=1:step:sz
        if i==1
            base=10^(i-1-min);
        else
            base=10^((i-1)/step-min);
        end
        plusbase=base*10;
        freq(i)=base;
    for j=1:step-1
        freq(i+j)=j*(base+plusbase)/step
    end
    end
    freq=freq(1:sz);
    for i=1:sz
        funs(i)=sin(freq(i)*t);
    end
        
    % Find handle to hidden figure
    temp = get(0,'showHiddenHandles');
    set(0,'showHiddenHandles','on');
    hfig = gcf;
    % Get the handles structure
    handles = guidata(hfig);
    % This changes the start time
    set(handles.axisStart, 'String', '0');
    % This changes the end time

    % This changes the refine output
    set(handles.refineOutput, 'String', '1');


    for k=1:length(funs)
    a=funs(k);
    period=2*pi/freq(k)
    runtime=10*period;
    set(handles.axisEnd, 'String', runtime);
    % This changes the step size
    set(handles.stepSize, 'String', 1/(100*(freq(k))));
    % You need to use a string for the equation you want
    % Or if you have a variable you can use sprintf which is like the
    % printf function in c programming
    name = sprintf('%s',char(a));
    set(handles.input, 'String', name );
    blackBox('input_Callback',handles.input,[],handles);

 
    iteration = num2char(k);
    
    % This changes the save file name
    set(handles.saveFile, 'String', iteration );

    % Use the run button
    blackBox('run_Callback',handles.run,[],handles);

    % Use the save button
    blackBox('save_Callback',handles.save,[],handles);
    set(0,'showHiddenHandles',temp);
    end
    
    %=======================Do Not Edit========================================
 
end