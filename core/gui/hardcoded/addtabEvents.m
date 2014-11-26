function handles = addtabEvents( parent, handles )
%ADDTABEVENTS Builds the UI for WF localization
%   This function adds following members to the shared handles structure:
%   
%   handles.axesEvents
%   handles.sliderEvents
%   handles.localizerEvents

vBoxLeft = uix.VBox('Parent', parent, ...
    'Padding', 5, ...
    'Spacing', 5);
vBoxRight = uix.VBox('Parent', parent, ...
    'Padding', 5, ...
    'Spacing', 5);

% Set widths of the main GUI columns
set(parent, 'Widths', [ -2 -1 ]);

% Add localizer image display and slider control.
axesPanel = uix.Panel('Parent', vBoxLeft);
handles.axesEvents = axes('Parent', axesPanel);
axis square

frameControlVBox = uix.VBox( 'Parent', vBoxLeft, 'Padding', 10, 'Spacing', 5 , ...
    'BackgroundColor', 'b');
handles.sliderEvents = uicontrol('Parent', frameControlVBox, ...
    'BackgroundColor', [.9 .9 .9], ...
    'Style', 'Slider', ...
    'Callback', @onSlideEventsMove);

set(vBoxLeft, 'Heights', [ -2 -0.2 ]);

% Add additional panels inside right part of GUI.
%% Localizer controls
localizerPanel = uix.Panel('Parent', vBoxRight, ...
    'Padding', 5);

localizerGrid = uix.Grid('Parent', localizerPanel, ...
    'Spacing', 5);

uicontrol('Parent', localizerGrid, ...
    'Style', 'text', ...
    'String', 'Psf width');

uicontrol('Parent', localizerGrid, ...
    'Style', 'text', ...
    'String', 'Pfa');

uicontrol('Parent', localizerGrid, ...
    'Style', 'text', ...
    'String', 'No. of frames');

uicontrol('Parent', localizerGrid, ...
    'Style', 'text', ...
    'String', 'Current frame');

uicontrol('Parent', localizerGrid, ...
    'Style', 'text', ...
    'String', 'No. of localized spots');

uicontrol('Parent', localizerGrid, ...
    'Style', 'pushbutton', ...
    'String', 'Localize!', ...
    'Callback', @onLocalizeEvents);

uicontrol('Parent', localizerGrid, ...
    'Style', 'edit', ...
    'String', '3', ...
    'Tag', 'Psfwidth');

uicontrol('Parent', localizerGrid, ...
    'Style', 'edit', ...
    'String', '50', ...
    'Tag', 'Pfa');

uicontrol('Parent', localizerGrid, ...
    'Fontweight', 'bold', ...
    'Style', 'text', ...
    'String', '0', ...
    'Tag', 'Nofframes');

uicontrol('Parent', localizerGrid, ...
    'Fontweight', 'bold', ...
    'Style', 'text', ...
    'String', '0', ...
    'Tag', 'Currframe');

uicontrol('Parent', localizerGrid, ...
    'Fontweight', 'bold', ...
    'Style', 'text', ...
    'String', '0', ...
    'Tag', 'Noflocalizations');

uix.Empty( 'Parent', localizerGrid )

set(localizerGrid, 'Widths', [ -1 -0.5 ], 'Heights', [ 25 25 25 25 25 25 ]);

disablechildcontrols(localizerPanel);

handles.localizerEvents = localizerPanel;

handles.pathEvents = '';
handles.fileEvents = '';
handles.currentframeEvents = 0;
handles.streamEvents = 0;

handles.XYEvents = [ 1 0 0 ];

end

