function testaudio()

sampleRate = 44100;
duration  = 0.5;
freqs = [100 200 300 400 500 600 700 800 900 1000 1100 1200];

[signal t] = generateTone(freqs, sampleRate, duration);
sound(signal, sampleRate);

%generates a tone (pure or complex)
function [y t] = generateTone(freqs, sampleRate, duration)
    timeSamples = duration * sampleRate;

    t = linspace(0, duration, timeSamples);
    y = zeros(size(t));
    env = generateEnvelope(t);

    for i=1:length(freqs)
        temp = env.*sin(2*pi*freqs(i)*t);
        y = y + temp;
    end


    % amplitude normalisation
    y = y' / max(abs(y));

end

function y = generateEnvelope(t, alfa)
    alfa = 1;
    y = (-t.^alfa) .* log(t./max(t));
    y(1) = 0;
end

end

