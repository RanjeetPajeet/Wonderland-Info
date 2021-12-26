%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%  Update price and APY charts (every 20 minutes)  %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% URL to read data from
url = 'https://fohmo-backend.p.rapidapi.com/GetStakingInfoQuery?rapidapi-key=17af12b0abmsh167260da09307b9p13707fjsna5e9063e4a5b&key=AVAX-TIME';


% Target strings to search in API response
targetString2 = '"rawPrice":';
targetString3 = '"rawApy":';


% Channel ID to write data to
writeChannelID = 1616375;


% Write API Key for channel to write to
writeAPIKey = 'LRB79S9AXVM3SUGU';


% Scrape the response
timeprice = urlfilter(url, targetString2);
apy = urlfilter(url, targetString3);


%% Write Data %%
thingSpeakWrite(writeChannelID, 'Fields', [3,4], 'Values', [timeprice, apy], 'WriteKey', writeAPIKey);
