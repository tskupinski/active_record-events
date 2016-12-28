require 'active_support'
require 'verbs'

module ActiveRecord
  module Events
    def self.past_participle(infinitive)
      options = { tense: :past, aspect: :perfective }
      infinitive.verb.conjugate(options)
    end

    def has_events(*names)
      names.each { |n| has_event(n) }
    end

    def has_event(name)
      _module = ActiveRecord::Events

      past_participle = _module.past_participle(name)
      field_name = "#{past_participle}_at"

      define_method("#{past_participle}?") do
        self[field_name].present?
      end

      define_method(name) do
        touch(field_name) if self[field_name].blank?
      end

      define_method("#{name}!") do
        touch(field_name)
      end

      define_singleton_method(past_participle) do
        where(arel_table[field_name].not_eq(nil))
      end

      define_singleton_method("not_#{past_participle}") do
        where(arel_table[field_name].eq(nil))
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  extend ActiveRecord::Events
end
