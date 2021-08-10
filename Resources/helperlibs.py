from robot.api.deco import keyword

@keyword("get_state_dropdown_xpath")
def get_state_dropdown_xpath(state):
    # Helper keyword to retrieve state xpath from  the value parsed in the command line
        str_state = str(state)
        state_xpath = "//*[@id=""state""]//font/font[contains(.," + str_state + ")]"

        return state_xpath

@keyword("get_city_dropdown_xpath")
def get_city_dropdown_xpath(state, city):
    # Helper keyword to retrieve city xpath from both the state and city values parsed in the command line
        city_xpath = ""
        if (state == "Uttar Pradesh"):
            if (city =="Agra"):
                city_xpath = "//*[@id='react-select-4-option-0'][contains(.," + city + ")]"
            elif (city =="Lucknow"):
                city_xpath = "//*[@id='react-select-4-option-1'][contains(.," + city + ")]"
            else:
                city_xpath = "//*[@id='react-select-4-option-2'][contains(.," + city + ")]"
        elif (state == "NCR"):
            if (city =="Delhi"):
                city_xpath = "//*[@id='react-select-4-option-0'][contains(.," + city + ")]"
            elif (city =="Gurgaon"):
                city_xpath = "//*[@id='react-select-4-option-1'][contains(.," + city + ")]"
            else:
                city_xpath = "//*[@id='react-select-4-option-2'][contains(.," + city + ")]"
        elif (state == "Haryana"):
            if (city =="Karnal"):
                city_xpath = "//*[@id='react-select-4-option-0'][contains(.," + city + ")]"
            elif (city =="Panipat"):
                city_xpath = "//*[@id='react-select-4-option-1'][contains(.," + city + ")]"
        elif (state == "Rajasthan"):
            if (city =="Jaipur"):
                city_xpath = "//*[@id='react-select-4-option-0'][contains(.," + city + ")]"
            elif (city =="Jaiselmer"):
                city_xpath = "//*[@id='react-select-4-option-1'][contains(.," + city + ")]"
        return city_xpath