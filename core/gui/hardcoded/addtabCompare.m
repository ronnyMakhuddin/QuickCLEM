function handles = addtabCompare( parent, handles )
%ADDTABCOMPARE Builds the UI for the CL vs SEM grid comparison
%   This function adds following members to the shared handles structure:
%   
%   handles.axesCompareCL
%   handles.axesCompareSEM

hBox = uix.HBox('Parent', parent, ...
    'Padding', 5, ...
    'Spacing', 5);

handles.axesCompare = axes('Parent', hBox);
axis square

% Set widths of the main GUI columns
% set(hBox, 'Widths', [ -1 -1 ]);

handles.XYSEM = [ 1 0 0 ];

end

