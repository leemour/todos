module Sortable
  extend ActiveSupport::Concern

  class_methods do
    def order_by(sort)
      relation = self.where(nil)
      return relation if sort.nil? || sort.empty?
      return relation unless %w[asc desc].include?(sort[:order])
      return relation unless self.column_names.include?(sort[:column])

      relation.reorder("#{sort[:column]} #{sort[:order]}")
    end
  end
end
