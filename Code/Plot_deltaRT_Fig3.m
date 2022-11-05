%% Code for plotting the violine plots for Figure 3

k = 1; % All Precursors
%k = 2; % Top 10 % most abundandt P=precursors

Files = { 'deltaRT_10222022', 'deltaRT_top10_11022022'};


dat = importdata( [path '../2022_PerspectiveS/' Files{k} '.txt' ] );


%%
close all
dh = distributionPlot( dat(:,1), 'color',{0.8*[1 0 0], 0.2*[1 1 1]}, ...
     'groups', dat(:,2), 'showMM', 3, 'divFactor', -8: 0.4 : 8, 'distWidth', 0.95 ); hold on

set( dh{2}, 'Marker', 'None' );

h(1) = ylabel( 'RT error, s' );
%h(2) = xlabel( 'Number of cells in the isobaric carrier' );
set(h, 'FontSize', 28 ); 

set(gca, 'Xtick', [1, 2], 'XtickLabel', {'Within run', 'Between runs'} );
set(gca, 'FontSize', 22 );
xlim( [0.5 2.5]);

ht(1) = text( 0.6, 9.2, ['|\DeltaRT| = ' num2sepstr(round(1e3*median( abs( dat( dat(:,2)==1, 1)))))  ' ms'], 'color', 0.8*[1 0 0] );
ht(2) = text( 1.6, 9.2, ['|\DeltaRT| = ' num2sepstr(round(1e3*median( abs( dat( dat(:,2)==2, 1))))) ' ms'], 'color', 0.2*[1 1 1] );

set(ht, 'FontSize', 16 ); 


fprintf( 'Widthin run: %1.2f s \n',  median( abs( dat( dat(:,2)==1, 1))) )
fprintf( 'Between runs: %1.2f s \n \n', median( abs( dat( dat(:,2)==2, 1))) )

%%
pdf( [path '../2022_PerspectiveS/' Files{k} ], [6 6], 1 )

%%





