<div class="container">
	<div class="card">
	
		<img class="img-fluid" src="<?= base_url('assets/gambar/') . $pengaduan->foto ?>" alt="Card image cap">
		<div class="card-body">
			<h5 class="card-title text-capitalize">Identitas : <?= $pengaduan->nama ?>&nbsp;(<?= $pengaduan->nik ?>)
			</h5>
			<p class="card-text">
				<h5>Isi Laporan : </h5>
				<p><?= $pengaduan->isi_laporan ?></p>
			</p>
			<hr>
				
			<form action="" method="post" enctype="multipart/form-data">
			<div class="form-group row">
			<label for="foto" class="col-sm-3 col-form-label">Foto</label>
			<div class="col-sm-8">
				<input type="file" name="foto" id="foto" class="form-control" placeholder=""
					aria-describedby="helpId" value="<?= set_value('foto') ?>" required>
				<small id="helpId" class="text-muted"><?php echo form_error('foto', '<div class="alert alert-danger mt-2">', '</div>'); ?></small>
			</div>
		</div>
			

			<form action="" method="post">
				<div class="form-group row col-sm-12">
					<input type="hidden" value="<?= $pengaduan->id ?>" name="id_pengaduan">
					<label for="balasan" class="col-form-label">Balasan</label>
					<textarea name="balasan" class="form-control" id="balasan"
						rows="4"><?= set_value('balasan') ?></textarea>
				</div>

				

				<div class="form-group row justify-content-center">
					<a href="<?= base_url('admin/kelola') ?>" class="btn btn-warning">Kembali</a> &nbsp; 
					<button type="submit" class="btn btn-primary">Simpan</button>
				</div>
			</form>
		</div>
	</div>
</div>
