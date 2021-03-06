classdef (Abstract) Data
    properties (Abstract, Dependent)
        NumVariants
    end


    methods (Hidden)
        varargout = appendData(varargin)
        varargout = checkInputDatabank(varargin)
        varargout = requestData(varargin)
    end
end
