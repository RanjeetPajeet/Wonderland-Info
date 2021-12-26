%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%  Update current holdings after rebase (every 8 hours)  %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Channel ID to read data from:
readChannelID = 1616375;

% Channel ID to write data to:
writeChannelID = 1616375;

% Write API Key for channel to write to:
writeAPIKey = 'LRB79S9AXVM3SUGU';




%% Read Data %%
% Holdings prior to next rebase:
currentHoldings_a = thingSpeakRead(readChannelID, 'Field', 1, 'NumPoints', 100);
currentHoldings_b = rmmissing(currentHoldings_a);
currentHoldings = currentHoldings_b(end);


% Next rebase yield as decimal percentage:
url = 'https://fohmo-backend.p.rapidapi.com/GetStakingInfoQuery?rapidapi-key=17af12b0abmsh167260da09307b9p13707fjsna5e9063e4a5b&key=AVAX-TIME';
targetString = '"stakingRebase":';
nextyield = 1 + urlfilter(url, targetString);



%% Analyze Data %%
newholdings = currentHoldings * nextyield;


%% Write Data %%
thingSpeakWrite(writeChannelID, 'Field', 1, 'Value', newholdings, 'WriteKey', writeAPIKey);
