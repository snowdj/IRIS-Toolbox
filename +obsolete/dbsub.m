function This = dbsub(This,List)
warning('iris:obsolete', [ ...
   '\n*** DBSUB is an obsolete function and will be deprecated in future versions.', ...
   '\n    Use d=d*list instead of d=dbsub(d,list).', ...
   ]);
This = This * List;
end