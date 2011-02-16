class SpreadsheetService
  FILE_NAME = "user_profiles.xls"

  def self.print print_entity
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => "group members"

    print_entity[:members].each_with_index do |member, i|
      sheet[i, 0] = member[:name]
      sheet[i, 1] = member[:profile]
    end

    book.write FILE_NAME
    FILE_NAME
  end
end