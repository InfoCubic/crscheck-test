<%

Function SelectIfSame(val1, val2)	
	If val1 = val2 Then
		Response.Write("selected=""selected""")
	End If	
End Function

%>
            <tr>
                <th><span style="color:#f00">*</span> Your Name:</th>
                <td><input type="text" id="NameBox" name="NameBox" class="srchBox" value="<%=Session("NameBox") %>" /></td>
            </tr>
            <tr>
                <th>Company Name:</th>
                <td><input type="text" id="CompanyName" name="CompanyName" class="srchBox" /></td>
            </tr>
            <tr>
                <th>State:</th>
                <td>
                    <select id="State" name="State" class="srchBox">
                          <option value="">Select State  </option>
                          <option value="AK" <%= SelectIfSame(Session("stateName"), "AK") %>>Alaska</option>
                          <option value="AL" <%= SelectIfSame(Session("stateName"), "AL") %>>Alabama</option>
                          <option value="AR" <%= SelectIfSame(Session("stateName"), "AR") %>>Arkansas</option>
                          <option value="AZ" <%= SelectIfSame(Session("stateName"), "AZ") %>>Arizona</option>
                          <option value="CA" <%= SelectIfSame(Session("stateName"), "CA") %>>California</option>
                          <option value="CA" <%= SelectIfSame(Session("stateName"), "CO") %>>Colorado</option>					  
                          <option value="CT" <%= SelectIfSame(Session("stateName"), "CT") %>>Connecticut</option>
                          <option value="DC" <%= SelectIfSame(Session("stateName"), "DC") %>>Washington DC</option>
                          <option value="DE" <%= SelectIfSame(Session("stateName"), "DE") %>>Delaware</option>
                          <option value="FL" <%= SelectIfSame(Session("stateName"), "FL") %>>Florida</option>
                          <option value="GA" <%= SelectIfSame(Session("stateName"), "GA") %>>Georgia</option>
                          <option value="HI" <%= SelectIfSame(Session("stateName"), "HI") %>>Hawaii</option>
                          <option value="IA" <%= SelectIfSame(Session("stateName"), "IA") %>>Iowa</option>
                          <option value="ID" <%= SelectIfSame(Session("stateName"), "ID") %>>Idaho</option>
                          <option value="IL" <%= SelectIfSame(Session("stateName"), "IL") %>>Illinois</option>
                          <option value="IN" <%= SelectIfSame(Session("stateName"), "IN") %>>Indiana</option>
                          <option value="KS" <%= SelectIfSame(Session("stateName"), "KS") %>>Kansas</option>
                          <option value="KY" <%= SelectIfSame(Session("stateName"), "KY") %>>Kentucky</option>
                          <option value="LA" <%= SelectIfSame(Session("stateName"), "LA") %>>Louisiana</option>
                          <option value="MA" <%= SelectIfSame(Session("stateName"), "MA") %>>Massachusetts</option>
                          <option value="MD" <%= SelectIfSame(Session("stateName"), "MD") %>>Maryland</option>
                          <option value="ME" <%= SelectIfSame(Session("stateName"), "ME") %>>Maine</option>
                          <option value="MI" <%= SelectIfSame(Session("stateName"), "MI") %>>Michigan</option>
                          <option value="MN" <%= SelectIfSame(Session("stateName"), "MN") %>>Minnesota</option>
                          <option value="MO" <%= SelectIfSame(Session("stateName"), "MO") %>>Missouri</option>
                          <option value="MS" <%= SelectIfSame(Session("stateName"), "MS") %>>Mississippi</option>
                          <option value="MT" <%= SelectIfSame(Session("stateName"), "MT") %>>Montana</option>
                          <option value="NC" <%= SelectIfSame(Session("stateName"), "NC") %>>North Carolina</option>
                          <option value="ND" <%= SelectIfSame(Session("stateName"), "ND") %>>North Dakota</option>
                          <option value="NE" <%= SelectIfSame(Session("stateName"), "NE") %>>Nebraska</option>
                          <option value="NH" <%= SelectIfSame(Session("stateName"), "NH") %>>New Hampshire</option>
                          <option value="NJ" <%= SelectIfSame(Session("stateName"), "NJ") %>>New Jersey</option>
                          <option value="NM" <%= SelectIfSame(Session("stateName"), "NM") %>>New Mexico</option>
                          <option value="NV" <%= SelectIfSame(Session("stateName"), "NV") %>>Nevada</option>
                          <option value="NY" <%= SelectIfSame(Session("stateName"), "NY") %>>New York</option>
                          <option value="OH" <%= SelectIfSame(Session("stateName"), "OH") %>>Ohio</option>
                          <option value="OK" <%= SelectIfSame(Session("stateName"), "OK") %>>Oklahoma</option>
                          <option value="OR" <%= SelectIfSame(Session("stateName"), "OR") %>>Oregon</option>
                          <option value="PA" <%= SelectIfSame(Session("stateName"), "PA") %>>Pennsylvania</option>
                          <option value="RI" <%= SelectIfSame(Session("stateName"), "RI") %>>Rhode Island</option>
                          <option value="SC" <%= SelectIfSame(Session("stateName"), "SC") %>>South Carolina</option>
                          <option value="SD" <%= SelectIfSame(Session("stateName"), "SD") %>>South Dakota</option>
                          <option value="TN" <%= SelectIfSame(Session("stateName"), "TN") %>>Tennessee</option>
                          <option value="TX" <%= SelectIfSame(Session("stateName"), "TX") %>>Texas</option>
                          <option value="UT" <%= SelectIfSame(Session("stateName"), "UT") %>>Utah</option>
                          <option value="VA" <%= SelectIfSame(Session("stateName"), "VA") %>>Virginia</option>
                          <option value="VT" <%= SelectIfSame(Session("stateName"), "VT") %>>Vermont</option>
                          <option value="WA" <%= SelectIfSame(Session("stateName"), "WA") %>>Washington</option>
                          <option value="WI" <%= SelectIfSame(Session("stateName"), "WI") %>>Wisconsin</option>
                          <option value="WV" <%= SelectIfSame(Session("stateName"), "WV") %>>West Virginia</option>
                          <option value="WY" <%= SelectIfSame(Session("stateName"), "WY") %>>Wyoming</option>
                          <option value="WY" <%= SelectIfSame(Session("stateName"), "OT") %>>others</option>					  
                        </select>
                </td>
            </tr>
            <tr>
                <th><span style="color:#f00">*</span> E-mail:</th>
                <td><input type="text" id="EmailBox" name="EmailBox" class="srchBox" /></td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td><input type="text" id="Phone" name="Phone" class="srchBox" />
                <textarea id="MyTiap2" name="MyTiap2" rows="2" cols="4"></textarea></td>
            </tr>
            <tr>
                <th>Contact me via:</th>
                <td><input id="phone_rd" name="contactme" type="radio" value="phone" /><label for="phone_rd">Phone</label>
                    <input id="email_rd" name="contactme" type="radio" value="email" /><label for="email_rd">E-mail</label></td>
            </tr>
            <tr>
                <th>Screening Locations needed:</th>
                <td>
                    <input type="checkbox" class="srchBox" id="ScreeningLocations1" name="ScreeningLocations" value="Nationwide or mulitple states" /><label for="ScreeningLocations1">Nationwide or mulitple states</label>
                    <input type="checkbox" class="srchBox" id="ScreeningLocations2" name="ScreeningLocations" value="Home State" /><label for="ScreeningLocations2">Home State</label>
                </td>
            </tr>
            <tr>
                <th>Products Interested In:</th>
                <td>
                    <select id="ProductsInterested" name="ProductsInterested" class="srchBox">
                        <option value=""> Please select </option>
                        <option value="5 Panel"> 5 Panel </option>
                        <option value="10 Panel"> 10 Panel </option>
                        <option value="DOT Testing"> DOT Testing </option>
                        <option value="Healthcare Screening"> Healthcare Screening </option>
                        <option value="Others"> Others </option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Average hire per month:</th>
                <td>
                    <select id="Avg" name="Avg">
                        <option value=""> Please select </option>
                        <option value="only 1"> only 1 </option>
                        <option value="2-5"> 2-5 </option>
                        <option value="6-10"> 6-10 </option>
                        <option value="11-50"> 11-50 </option>
                        <option value="51-100"> 51-100 </option>
                        <option value="over 100"> over 100</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Comments:<br />(please be as detailed as possible)</th>
                <td><textarea cols="40" rows="5" id="MyTiap1" name="MyTiap1" class="srchBox" ></textarea></td>
            </tr>


