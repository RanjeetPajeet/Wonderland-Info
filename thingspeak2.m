%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               %
%  Update value of holdings (every 20 minutes)  %
%                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Channel ID to read data from:
readChannelID = 1616375;

% Channel ID to write data to:
writeChannelID = 1616375;

% Write API Key for channel to write to:
writeAPIKey = 'LRB79S9AXVM3SUGU';



%% Read Data %%
% Current holdings:
holdings_a = thingSpeakRead(readChannelID, 'Field', 1, 'NumPoints', 100);
holdings_b = rmmissing(holdings_a);
holdings = holdings_b(end);

url = 'https://fohmo-backend.p.rapidapi.com/GetStakingInfoQuery?rapidapi-key=17af12b0abmsh167260da09307b9p13707fjsna5e9063e4a5b&key=AVAX-TIME';
targetString = '"rawPrice":';

% Current TIME price:
timeprice = urlfilter(url, targetString);



%% Analyze Data %%
valueOfHoldings = holdings * timeprice;



%% Write Data %%
thingSpeakWrite(writeChannelID, 'Field', 2, 'Value', valueOfHoldings, 'WriteKey', writeAPIKey);
