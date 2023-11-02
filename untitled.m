
%Inicjalizacja wartości x na przedziale [10^-2, 10^2]
x_values = logspace(-2, 2, 100);



% Inicjalizacja tablic na wyniki
f_double_results = zeros(1, 100);
f_double_single_results = zeros(1, 100);
relative_errors = zeros(1, 100);
estimated_errors = zeros(1,100);


%obliczanie wartości błędu względnego dla 100 wartości x w pętli
for i = 1:100
    x = x_values(i);

    %T(x)
    T = (1 - 7*log10(x) - 2*x.^9) / (log10(x) - x.^9);

    % (a) Obliczenia w podwójnej precyzji
    f_double = (log10(x) / x^7) - x^2;

    % (b) Obliczenia w pojedynczej precyzji i konwersja z powrotem do podwójnej precyzji
    x_single = single(x);
    f_single = (log10(x_single) / x_single^7) - x_single^2;
    f_double_single = double(f_single);

    % Błąd względny obliczeń w pojedynczej precyzji w porównaniu z podwójną precyzją
    relative_error = abs(f_double_single - f_double) / abs(f_double);
    estimated_error = abs(T)*eps('single')/2;

    % Zapisanie wyników
    f_double_results(i) = f_double;
    f_double_single_results(i) = f_double_single;
    relative_errors(i) = relative_error;
    estimated_errors(i) = estimated_error;
end



% Narysowanie wartości błędów względnych na wykresie logarytmicznym
semilogx(x_values, estimated_errors, 'r-');
title('Błąd względny w zależności od x');
xlabel('x');
ylabel('Błąd względny');
grid on;

hold on 
semilogx(x_values, relative_errors, 'b-');

legend('Maksymalny błąd względny', 'Relatywny błąd względny');
title('Błąd względny w zależności od x');

