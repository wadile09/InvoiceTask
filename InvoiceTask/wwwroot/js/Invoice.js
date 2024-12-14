$(document).ready(function () {
    setTimeout(function () {
        $('#successalert').fadeOut();
    }, 5000);
});

$("#addItemButton").click(function () {
    debugger;
    var rowCount = $("#itemTable tr").length;
    var options = '<option value="">--Select Item--</option>';

    if (typeof availableItems !== "undefined") {
        availableItems.forEach(item => {
            options += `<option value="${item.Value}">${item.Text}</option>`;
        });
    }

    var newRow = ` <tr> 
                       <td>
                          <select name="Items[${rowCount}].ItemId" class="form-control" onchange="updateItemRate(this)">${options}</select>
                       </td>
                       <td>
                          <input name="Items[${rowCount}].Rate" class="form-control" readonly />
                       </td>
                       <td>
                          <input name="Items[${rowCount}].Quantity" class="form-control" type="number" /><span asp-validation-for="Items[${rowCount}].Quantity" class="text-danger"></span>
                       </td>
                       <td>
                           <input name="Items[${rowCount}].Discount" class="form-control" type="number" step="0.01" />
                       </td>
                       <td>
                          <input name="Items[${rowCount}].Total" class="form-control" readonly />
                       </td>
                       <td>
                          <button type="button" class="btn btn-sm" onclick="removeItem(this)" title="Remove"><i class="fa fa-trash" style="font-size:25px; color:red;"></i></button>
                       </td>
                </tr>`;

    $("#itemTable").append(newRow);
});

window.updateItemRate = function (selectElement) {
    var itemId = selectElement.value;
    var row = $(selectElement).closest('tr');

    if (!itemId) return;

    fetch(`/Invoice/GetItemRate?itemId=${itemId}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                row.find("input[name$='.Rate']").val(data.rate);
                updateRowTotal(row); // Call to update totals whenever the rate is set
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error fetching item rate:', error);
            alert('Error fetching item rate.');
        });
};

window.removeItem = function (button) {
    $(button).closest('tr').remove();
    updateInvoiceTotals();
};

function updateInvoiceTotals() {
    var subtotal = 0;
    var totalDiscount = 0;

    $("#itemTable tr").each(function () {
        var row = $(this);
        var total = parseFloat(row.find("input[name$='.Total']").val()) || 0;
        var discount = parseFloat(row.find("input[name$='.Discount']").val()) || 0;

        subtotal += total;
        totalDiscount += discount;
    });

    $("input[name='Subtotal']").val(subtotal.toFixed(2));
    $("input[name='TotalDiscount']").val(totalDiscount.toFixed(2));
    $("input[name='Total']").val((subtotal - totalDiscount).toFixed(2));  // Adjust total after discount
}

$(document).on("input", "input[name$='.Quantity'], input[name$='.Discount']", function () {
    var row = $(this).closest('tr');
    updateRowTotal(row);
});

function updateRowTotal(row) {
    var rate = parseFloat(row.find("input[name$='.Rate']").val()) || 0;
    var quantity = parseFloat(row.find("input[name$='.Quantity']").val()) || 0;
    var discount = parseFloat(row.find("input[name$='.Discount']").val()) || 0;

    var total = (rate * quantity) - discount;
    row.find("input[name$='.Total']").val(total.toFixed(2));

    updateInvoiceTotals(); // Update the overall totals after a row's total is updated
}

function getCustomerMobile() {
    var customerId = $("select[name='CustomerId']").val();
    if (customerId) {
        $.ajax({
            url: 'Invoice/GetCustomerMobileNumber',
            type: 'GET',
            data: { customerId: customerId },
            success: function (response) {
                if (response.success)
                    $("input[name='Mobile']").val(response.data.mobile);
                else
                    $("input[name='Mobile']").val('');
            },
            error: function () {
                $("input[name='Mobile']").val('');
            }
        });
    } else {
        $("input[name='Mobile']").val('');
    }
}
