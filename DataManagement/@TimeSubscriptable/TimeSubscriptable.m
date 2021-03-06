classdef (Abstract, InferiorClasses={?matlab.graphics.axis.Axes}) TimeSubscriptable
    properties (Abstract)
        Start
        Data
        MissingValue
    end


    properties (Dependent)
        End
        Frequency
        Range
    end


    properties (Abstract, Dependent)
        MissingTest
    end


    methods (Abstract)
        varargout = getFrequency(varargin)
    end


    methods (Abstract, Access=protected, Hidden)
        varargout = startDateWhenEmpty(varargin)
    end


    methods (Access=protected)
        varargout = getDataNoFrills(varargin)
        varargout = implementPlot(varargin)
        varargout = subsCase(varargin)


        function flag = validateDate(this, date)
            if ~isequal(class(this.Start), class(date))
                flag = false;
                return
            end
            if isnan(this.Start)
                flag = true;
                return
            end
            flag = all(getFrequency(this.Start)==getFrequency(date));
        end
    end


    methods
        varargout = getData(varargin)
        varargout = ifelse(varargin)
        varargout = ellpea(varargin)
        varargout = shift(varargin)


        function varargout = plot(varargin)
            [varargout{1:nargout}] = implementPlot(@plot, varargin{:});
        end


        function varargout = bar(varargin)
            [varargout{1:nargout}] = implementPlot(@bar, varargin{:});
        end


        function varargout = area(varargin)
            [varargout{1:nargout}] = implementPlot(@area, varargin{:});
        end


        function varargout = stem(varargin)
            [varargout{1:nargout}] = implementPlot(@stem, varargin{:});
        end


        function endDate = get.End(this)
            if isnan(this.Start)
                endDate = this.Start;
                return
            end
            endDate = addTo(this.Start, size(this.Data, 1)-1);
        end


        function frequency = get.Frequency(this)
            frequency = getFrequency(this);
        end


        function range = get.Range(this)
            if isnan(this.Start)
                range = this.Start;
                return
            end
            vec = transpose(0:size(this.Data, 1)-1);
            range = addTo(this.Start, vec);
        end


        function this = emptyData(this)
            if isnan(this.Start) || size(this.Data, 1)==0
                return
            end
            sizeData = size(this.Data);
            newSizeOfData = [0, sizeData(2:end)];
            this.Start = startDateWhenEmpty(this);
            this.Data = repmat(this.MissingValue, newSizeOfData);
        end


        function output = applyFunctionAlongDim(this, func, varargin)
            [output, dim] = func(x.Data, varargin{:});
            if dim>1
                output = fill(this, output, '', [ ]);
            end
        end
    end


    methods (Static)
        varargout = getExpSmoothMatrix(varargin)
    end
end
