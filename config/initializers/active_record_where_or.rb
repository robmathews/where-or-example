module Arel
  module Visitors
    ToSql.class_eval do
      def visit_ActiveRecord_Relation_WhereClause(o, collector)
        if o.binds
          visit_Arel_Nodes_And(o.ast, collector)
        else
          collector << '1=1' # no-op
          collector
        end
      end
    end
  end
end