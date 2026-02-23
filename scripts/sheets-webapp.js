function doPost(e) {
  const data = JSON.parse(e.postData.contents);

  // Validação de token (ignora se SECRET_TOKEN não estiver configurado)
  const secretToken = PropertiesService.getScriptProperties().getProperty('SECRET_TOKEN');
  if (secretToken && data.token !== secretToken) {
    return ContentService.createTextOutput(JSON.stringify({error: 'Unauthorized'}))
      .setMimeType(ContentService.MimeType.JSON);
  }

  const ss = SpreadsheetApp.getActiveSpreadsheet();
  let sheet = ss.getSheetByName('Status');
  if (!sheet) {
    sheet = ss.insertSheet('Status');
    sheet.appendRow(['Timestamp', 'Project ID', 'Status', 'Motivo']);
    sheet.getRange(1, 1, 1, 4).setFontWeight('bold');
    sheet.setFrozenRows(1);
  }

  const timestamp = data.timestamp;
  const mods = data.mods || {};
  const rows = [];
  for (const [modId, info] of Object.entries(mods)) {
    const status = (info.status || '').trim();
    const reason = (info.reason || '').trim();
    rows.push([timestamp, modId, status, reason]);
  }
  if (rows.length > 0) {
    sheet.getRange(sheet.getLastRow() + 1, 1, rows.length, 4).setValues(rows);
  }

  return ContentService.createTextOutput(JSON.stringify({ok: true, written: rows.length}))
    .setMimeType(ContentService.MimeType.JSON);
}
