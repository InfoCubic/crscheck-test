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
                <th>Invoice #:</th>
                <td><input type="text" id="InvoiceNo" name="InvoiceNo" class="srchBox" /></td>
            </tr>
            <tr>
                <th>Your questions:</th>
                <td><textarea cols="40" rows="5" id="MyTiap1" name="MyTiap1" class="srchBox" ></textarea></td>
            </tr>


