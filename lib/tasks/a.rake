namespace :dev do
	desc "build system"
	task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]
	task :rebuild => ["dev:build", "db:seed"]
end