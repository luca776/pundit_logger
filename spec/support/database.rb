class SpecDatabase
  class << self
    def setup_database
      @@database_config ||= 
        { adapter: 'sqlite3', database: ':memory:' }
    end

    private

    def new
    end

    def defined_spec_db
      result = ENV['BUNDLE_GEMFILE'].to_s.match(/_([^_]*)\.gemfile/)
      result ? result[1] : nil
    end
  end
end