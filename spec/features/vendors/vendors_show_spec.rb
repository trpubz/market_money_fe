require "rails_helper"

describe "vendor show page" do
  it "shows the vendors information", :vcr do
    visit vendor_path("54924")

    expect(page).to have_content "CHZ PLZ"
    expect(page).to have_content "Verna"
    expect(page).to have_content "6344"
    expect(page).to have_content "Credid Accepted?: YES"
    expect(page).to have_content "artisanal cheeses"
  end
end
