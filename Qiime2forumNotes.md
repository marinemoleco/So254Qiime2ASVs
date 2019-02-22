**DADA2, truncation lengths and features number**

https://forum.qiime2.org/t/dada2-truncation-lengths-and-features-number/1940

**Too many singletons after Dada2 with paired-end reads**

https://forum.qiime2.org/t/too-many-singletons-after-dada2-with-paired-end-reads/7718

> ... previous forum posts say that some singletons may be expected when running paired-end data because Dada2 only removes singleton reads before merging, and the merging process can actually create some singletons.

> My suspicion is that because of the way DADA2 handles chimeras, by running each set of time points separately, you’re getting different sequences that survive chimera handling stochastically. It may be that if you denoise your data together, or use a secondary chimera handling approach (don’t use the built-in chimera handling in DADA2, and then use vsearch), you get fewer singletons because more sequences will survive the chimera filtering.

> We went back and were a little more aggressive with truncating and trimming this time, and I think it helped a little. We still have lots of singletons (and we haven’t combined any time points yet), but we figured that if they ARE noise/errors, they won’t match to anything when we do the taxonomy strings, and many of them might land in the “unassigned” category. We plan to filter out the “unassigned” taxa strings anyway, so we’d be getting rid of them eventually.


**Dada2: 90% read drop after filering and merging**

https://forum.qiime2.org/t/dada2-90-read-drop-after-filering-and-merging/6071

> Unfortunately looking at your reverse primers, the quality seems to drop rather early which in my opinion will make it harder to merge properly. In that case I think using the forward reads only (which seem to be in much better shape anyways) would be your best bet.

> Deblur works on one direction of reads only, meaning you can provide it paired-end reads but it will simply ignore the reverse reads. If you merge the forward and reverse reads prior to deblur, let’s say with q2-vsearch, it will denoise the full length. I should mention however that in this method the high quality scores of the overlap regions (as produced by consensus methods) are wasted since deblur doesn’t use those scores, instead uses its own error model which assumes that the quality scores continuously reduce as the length increases.

**Merging outside QIIME2: results for DADA2 and deblur**

https://forum.qiime2.org/t/merging-outside-qiime2-results-for-dada2-and-deblur/3457

> If you want to use deblur, you can join reads prior to denoising (either using PEAR and then importing, or using q2-vsearch to perform similar read joining from within QIIME2). This may be the easier approach, since you already have joined reads and would not need to fuss over trimming parameters.

> Joining reads disrupts the Q score profile, which dada2 uses to predict read errors. Many read joiners assign arbitrary Q scores to overlapping bases, which confuses dada2. So you need to use dada2 on the unjoined paired reads and dada2 will join these reads after denoising forward/reverse reads separately. You must adjust trimming parameters to make sure there is at least 20 bp of overlap between forward and reverse reads.

> You may want to adjust the confidence parameter to see if this improves your results, since you have mock communities to validate your results. The default is a good average across many different sequencing lengths/conditions but since you have a mock community you can re-tune this for your sequencing runs. Notably, QIIME2’s default confidence == 0.7, whereas RDP’s recommendation for short reads is 0.5, 0.8 for longer reads.
