function [out,PSL,ISL,PSLR,ISLR] = Analysis_Sidelobe(varargin)
    % Example: [out,PSL,ISL,PSLR,ISLR] = Analysis_Sidelobe(signal_1, signal_2, 'bool_draw', 1)
    % :param :
    % :return :
    % detailed description:
    %------------------------------------------------------------------------------
    % Created by: Xinyu Huang.
    % On: 14/11/2023.
    % Copyright (C) 2023 Xinyu Huang (learning_huang@163.com).
    % All Rights Reserved.
    % Unauthorized copying of this file, via any medium is strictly prohibited.
    % Proprietary and confidential.
    %------------------------------------------------------------------------------
        in_par = inputParser;
        addOptional(in_par, 'signal_1', 0);
        addOptional(in_par, 'signal_2', 0);
        addParameter(in_par, 'bool_draw', 0);
        parse(in_par,varargin{:});
        x1 = in_par.Results.signal_1;
        x2 = in_par.Results.signal_2;
        bool_draw = in_par.Results.bool_draw;
        x1 = x1(:)/max(x1(:)); % Normilized signal
        x2 = x2(:)/max(x1(:)); % Normilized signal
        N1 = length(x1);
        N2 = length(x2);
        N = max(N1, N2);
        if N1>N2
            x2 = [x2;zeros(N1-N2,1)];
        elseif N2>N1
            x1 = [x1;zeros(N2-N1,1)];
        end
        out = abs(xcorr(x1,x2));
        out = abs(out);
        out = out/max(out);
        P_t = out'*out;
        PSL = max((out(1:N-1)));
        ISL = sum((out(1:N-1)).^2);
        PSLR = 10*log10(PSL^2/P_t^2);
        ISLR = 10*log10(ISL/P_t^2);

        out = 10*log10(out); % dB
        if bool_draw
            n_grid_plot = -N+1:1:N-1;
            plot(n_grid_plot, out);
            xlabel('N');ylabel('dB');
        end
    end