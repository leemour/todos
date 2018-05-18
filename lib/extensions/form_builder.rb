module Extensions
  module FormBuilder
    include ActionView::Helpers::FormTagHelper

    def field_label(attribute, *args)
      options = args.extract_options!
      required = object.class.validators_on(attribute).any? do |v|
        v.kind_of? ActiveModel::Validations::PresenceValidator
      end
      label(attribute, options[:label], class: ("required" if required))
    end

    def error_span(attribute, options = {})
      options[:span_class] ||= 'help-block'
      options[:error_class] ||= 'has-error'

      if errors_on?(attribute)
        @template.content_tag( :div, :class => options[:error_class] )  do
          content_tag( :span, errors_for(attribute), :class => options[:span_class] )
        end
      end
    end

    def errors_on?(attribute)
      object.errors[attribute].present? if object.respond_to?(:errors)
    end

    def errors_for(attribute)
      object.errors[attribute].try(:join, ', ') || object.errors[attribute].try(:to_s)
    end
  end
end
