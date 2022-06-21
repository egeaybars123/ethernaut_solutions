contract = "contract instance";

await contract.contribute.sendTransaction({value: toWei("0.0005")});

await sendTransaction({value: toWei("0.0001")});

await contract.withdraw();
