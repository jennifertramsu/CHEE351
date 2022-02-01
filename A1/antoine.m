function pv = antoine(T, s)
% Function to calculate the vapour pressure of a pure species using
% Antoine's equation
% Parameters:
% T = temperature (deg C)
% s = species

if strcmp(s, 'm')
    a = 7.87863;
    b = 1473.11;
    c = 230;
elseif strcmp(s, 'w')
    a = 7.96681;
    b = 1668.210;
    c = 228;
end

logpv = a - b / (T + c);
pv = 10 ^ logpv; % mm Hg
pv = pv / 760; % atm

end