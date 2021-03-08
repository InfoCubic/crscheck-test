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
                <th>Country you ordered:</th>
                <td>
<select id="Country" name="Country">
                        <option value="">Select Country</option>
                        <option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="American Samoa">American Samoa</option>
<option value="Andorra">Andorra</option>
<option value="Angola">Angola</option>
<option value="Antigua">Antigua</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Aruba">Aruba</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bahamas">Bahamas</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Barbados">Barbados</option>
<option value="Belarus">Belarus</option>
<option value="Belgium">Belgium</option>
<option value="Belize">Belize</option>
<option value="Benin">Benin</option>
<option value="Bermuda">Bermuda</option>
<option value="Bhutan">Bhutan</option>
<option value="Bolivia">Bolivia</option>
<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="Brunei">Brunei</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burundi">Burundi</option>
<option value="Cambodia">Cambodia</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Cape Verde">Cape Verde</option>
<option value="Cayman Islands">Cayman Islands</option>
<option value="Central African Republic">Central African Republic</option>
<option value="Chad">Chad</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Colombia">Colombia</option>
<option value="Comoros">Comoros</option>
<option value="Congo(Dem. Republic of)">Congo(Dem. Republic of)</option>
<option value="Congo(Republic of)">Congo(Republic of)</option>
<option value="Cook Islands">Cook Islands</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Croatia">Croatia</option>
<option value="Curacao">Curacao</option>
<option value="Cyprus">Cyprus</option>
<option value="Czech Republic">Czech Republic</option>
<option value="Denmark">Denmark</option>
<option value="Djibouti">Djibouti</option>
<option value="Dominica">Dominica</option>
<option value="Dominican Republic">Dominican Republic</option>
<option value="East Timor">East Timor</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Equatorial Guinea">Equatorial Guinea</option>
<option value="Eritrea">Eritrea</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Federated States of Micronesia">Federated States of Micronesia</option>
<option value="Fiji">Fiji</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="French Guiana">French Guiana</option>
<option value="French Polynesia">French Polynesia</option>
<option value="Gabon">Gabon</option>
<option value="Gambia">Gambia</option>
<option value="Georgia">Georgia</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Greece">Greece</option>
<option value="Greenland">Greenland</option>
<option value="Grenada">Grenada</option>
<option value="Guadeloupe">Guadeloupe</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Guinea">Guinea</option>
<option value="Guinea Bissau">Guinea Bissau</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Ireland">Ireland</option>
<option value="Isle of Man">Isle of Man</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Ivory Coast">Ivory Coast</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Kiribati">Kiribati</option>
<option value="Kuwait">Kuwait</option>
<option value="Kyrgyz Republic">Kyrgyz Republic</option>
<option value="Laos">Laos</option>
<option value="Latvia">Latvia</option>
<option value="Lebanon">Lebanon</option>
<option value="Lesotho">Lesotho</option>
<option value="Liberia">Liberia</option>
<option value="Libya">Libya</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macau">Macau</option>
<option value="Macedonia">Macedonia</option>
<option value="Madagascar">Madagascar</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Maldives">Maldives</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Mariana Islands">Mariana Islands</option>
<option value="Marshall Islands">Marshall Islands</option>
<option value="Martinique">Martinique</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Mexico">Mexico</option>
<option value="Moldova">Moldova</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Montenegro">Montenegro</option>
<option value="Montserrat">Montserrat</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Namibia">Namibia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="New Zealand">New Zealand</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Norway">Norway</option>
<option value="Oman">Oman</option>
<option value="Pakistan">Pakistan</option>
<option value="Palau">Palau</option>
<option value="Panama">Panama</option>
<option value="Papua New Guinea">Papua New Guinea</option>
<option value="Paraguay">Paraguay</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Puerto Rico">Puerto Rico</option>
<option value="Qatar">Qatar</option>
<option value="Romania">Romania</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="Saint Lucia">Saint Lucia</option>
<option value="Saint Martin">Saint Martin</option>
<option value="Samoa">Samoa</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Scotland">Scotland</option>
<option value="Senegal">Senegal</option>
<option value="Serbia">Serbia</option>
<option value="Seychelles">Seychelles</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="Slovakia">Slovakia</option>
<option value="Slovenia">Slovenia</option>
<option value="Solomon Islands">Solomon Islands</option>
<option value="South Africa">South Africa</option>
<option value="South Korea">South Korea</option>
<option value="Spain">Spain</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="St. Kitts Nevis">St. Kitts Nevis</option>
<option value="St. Vincent and Grenadines">St. Vincent and Grenadines</option>
<option value="Sudan">Sudan</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Syria">Syria</option>
<option value="Taiwan">Taiwan</option>
<option value="Tajikistan">Tajikistan</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Tonga">Tonga</option>
<option value="Trinidad/Tobago">Trinidad/Tobago</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Turkmenistan">Turkmenistan</option>
<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
<option value="Tuvalu">Tuvalu</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="Uruguay">Uruguay</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Vanuatu">Vanuatu</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Virgin Islands UK">Virgin Islands UK</option>
<option value="Virgin Islands US">Virgin Islands US</option>
<option value="Yemen">Yemen</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>

                    </select>
                </td>
            </tr>
            <tr>
                <th>Comments:<br />(please be as detailed as possible)</th>
                <td><textarea cols="40" rows="5" id="MyTiap1" name="MyTiap1" class="srchBox" ></textarea></td>
            </tr>


