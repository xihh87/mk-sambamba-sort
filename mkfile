< sambamba.mk

# This program uses threads, use only one process
NPROC=1

results/sorted/%.bam:	data/%.bam
	mkdir -p `dirname "$target"`
	sambamba sort \
		--sort-by-name \
		--nthreads="$SAMBAMBA_THREADS" \
		--out="$target"'.build' \
		"$prereq" \
	&& mv "$target"'.build' "$target"
