namespace :import_transaction do
  require 'csv'

  desc "Imports a 'transacoes.csv' file into an ActiveRecord table"
  file = 'db\transacoes.csv'
  task :import_csv => :environment do
    File.open(file).each do |row|
      begin
        row = row.split(",")

        account = row[0].strip.to_i
        value = row[1].strip.to_i

        Transaction.create!(account: account, value: value)
      rescue => exception
        puts exception
        puts "A importação falhou, tente novamente!"
      end
    end
    puts "Importação de transação feita com sucesso :)"
  end
end
