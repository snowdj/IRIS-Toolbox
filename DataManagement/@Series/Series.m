classdef (InferiorClasses={?matlab.graphics.axis.Axes, ?DateWrapper}) ...
        Series < tseries
    methods
        function this = Series(varargin)
            this = this@tseries(varargin{:});
        end
    end


    methods
        function varargout = plot(varargin)
            [varargout{1:nargout}] = plot@TimeSubscriptable(varargin{:});
        end


        function varargout = bar(varargin)
            [varargout{1:nargout}] = bar@TimeSubscriptable(varargin{:});
        end


        function varargout = area(varargin)
            [varargout{1:nargout}] = area@TimeSubscriptable(varargin{:});
        end


        function varargout = stem(varargin)
            [varargout{1:nargout}] = stem@TimeSubscriptable(varargin{:});
        end


    end


    methods (Static)
        varargout = fromFred(varargin)
        varargout = linearTrend(varargin)
        varargout = empty(varargin)
    end
end
