


size_IPaddr = 4;
size_IPaddr_v6 = 16;
size_Port   = 2; 
size_TimeStamp = 5;         %Mysql DateTime
size_FractionalSeconds = 3; %MySQL Max time precision
size_BytesPerSession = 8;   %MySQL BIGINT


size_OneSession_v4 = 2*size_IPaddr + 2*size_Port + 2*size_TimeStamp + 2*size_FractionalSeconds + size_BytesPerSession;
size_OneSession_v6 = 2*size_IPaddr_v6 + 2*size_Port + 2*size_TimeStamp + 2*size_FractionalSeconds + size_BytesPerSession;

sessionsPerDay = 24*1250; % De 1250 er baseret på empiriske data fra min egen forbindelse111. 

StorageRequirementsPerDay = size_OneSession*sessionsPerDay;
StorageRequirementsPerDay_v6 = size_OneSession_v6*sessionsPerDay;

disp(['Pure IPv4: One customer require ' num2str((StorageRequirementsPerDay/1000/1000)) ' Mbytes of storage per day'])
disp(['Pure IPv6: One customer require ' num2str((StorageRequirementsPerDay_v6/1000/1000)) ' Mbytes of storage per day'])

disp(['Total amount of records to store: ' num2str(round((1/1e9)*sessionsPerDay*150000)) ' G records'])


disp(['Fullrate: Pure IPv4: Total storage/y: ' num2str(round((1/1e12)*StorageRequirementsPerDay*(365)*150000)) ' TB'])
disp(['Fullrate: Pure IPv6: Total storage/y: ' num2str(round((1/1e12)*StorageRequirementsPerDay_v6*(365)*150000)) ' TB'])

disp(['DK: Pure IPv4: Total storage/y: ' num2str(round((1/1e12)*StorageRequirementsPerDay*(365)*2654585)) ' TB'])
disp(['DK: Pure IPv6: Total storage/y: ' num2str(round((1/1e12)*StorageRequirementsPerDay_v6*(365)*2654585)) ' TB'])


