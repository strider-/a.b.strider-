class Commit
  include HTTParty

  base_uri "https://api.github.com/repos/strider-/a.b.strider-/commits"
  format :json

  attr_accessor :message, :date, :author, :url

  def initialize &block
    yield(self) if block_given?
  end

  def self.all
    results = []
    get("", :headers => {"User-Agent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36"}).each do |result|
      results << Commit.new do |c|
        c.message = result["commit"]["message"]
        c.date = Time.parse result["commit"]["committer"]["date"]
        c.author = result["commit"]["committer"]["name"]
        c.url = "https://github.com/strider-/a.b.strider-/commit/#{result["sha"]}"
      end
    end
    results
  end

  def self.latest count
    self.all[0..(count - 1)]
  end
end