function [ ] = checkLinearity()
    % Launch the GUI, which is a singleton
    blackBox
    syms t
    funs=[sin(t) 4*cos(4*t) sin(t)+4*cos(4*t)]
    length(funs)
    % Find handle to hidden figure
    temp = get(0,'showHiddenHandles');
    set(0,'showHiddenHandles','on');
    hfig = gcf;
    % Get the handles structure
    handles = guidata(hfig);
    % This changes the start time
    set(handles.axisStart, 'String', '0');
    % This changes the end time
    set(handles.axisEnd, 'String', '20');
    % This changes the step size
    set(handles.stepSize, 'String', '0.01');
    % This changes the refine output
    set(handles.refineOutput, 'String', '1');


    for k=1:length(funs)
    a=funs(k)
    % You need to use a string for the equation you want
    % Or if you have a variable you can use sprintf which is like the
    % printf function in c programming
    name = sprintf('%s',char(a));
    set(handles.input, 'String', name );
    blackBox('input_Callback',handles.input,[],handles);

    char(k)
    iteration = char(k+64)
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